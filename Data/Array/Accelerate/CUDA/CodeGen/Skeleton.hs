-- |
-- Module      : Data.Array.Accelerate.CUDA.CodeGen.Skeleton
-- Copyright   : [2008..2010] Manuel M T Chakravarty, Gabriele Keller, Sean Lee, Trevor L. McDonell
-- License     : BSD3
--
-- Maintainer  : Manuel M T Chakravarty <chak@cse.unsw.edu.au>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Constructors for array computation skeletons
--

module Data.Array.Accelerate.CUDA.CodeGen.Skeleton
  (
    mkFold, mkFoldSeg, mkMap, mkZipWith,
    mkScanl, mkScanr, mkScanl', mkScanr', mkScanl1, mkScanr1,
    mkPermute, mkBackpermute, mkIndex, mkReplicate
  )
  where

import Language.C
import System.FilePath
import Data.Array.Accelerate.CUDA.CodeGen.Data
import Data.Array.Accelerate.CUDA.CodeGen.Util
import Data.Array.Accelerate.CUDA.CodeGen.Tuple

--------------------------------------------------------------------------------
-- Reduction
--------------------------------------------------------------------------------

mkFold :: [CType] -> [CExpr] -> [CExpr] -> CUTranslSkel
mkFold ty identity apply = CUTranslSkel code [] skel
  where
    skel = "fold.inl"
    code = CTranslUnit
            ( mkTupleTypeAsc 2 ty ++
            [ mkTuplePartition ty
            , mkIdentity identity
            , mkApply 2 apply ])
            (mkNodeInfo (initPos skel) (Name 0))

mkFoldSeg :: [CType] -> [CType] -> [CExpr] -> [CExpr] -> CUTranslSkel
mkFoldSeg ty int identity apply = CUTranslSkel code [] skel
  where
    skel = "fold_segmented.inl"
    code = CTranslUnit
            ( mkTupleTypeAsc 2 ty ++
            [ mkTuplePartition ty
            , mkTypedef "Int" False (head int)
            , mkIdentity identity
            , mkApply 2 apply ])
            (mkNodeInfo (initPos skel) (Name 0))


--------------------------------------------------------------------------------
-- Map
--------------------------------------------------------------------------------

mkMap :: [CType] -> [CType] -> [CExpr] -> CUTranslSkel
mkMap tyOut tyIn0 apply = CUTranslSkel code [] skel
  where
    skel = "map.inl"
    code = CTranslUnit
            ( mkTupleType Nothing  tyOut ++
              mkTupleType (Just 0) tyIn0 ++
            [ mkApply 1 apply ])
            (mkNodeInfo (initPos skel) (Name 0))


mkZipWith :: ([CType], Int) -> ([CType], Int) -> ([CType], Int) -> [CExpr] -> CUTranslSkel
mkZipWith (tyOut,dimOut) (tyIn1,dimIn1) (tyIn0,dimIn0) apply = CUTranslSkel code [] skel
  where
    skel = "zipWith.inl"
    code = CTranslUnit
            ( mkTupleType Nothing  tyOut ++
              mkTupleType (Just 1) tyIn1 ++
              mkTupleType (Just 0) tyIn0 ++
            [ mkApply 2 apply
            , mkDim "DimOut" dimOut
            , mkDim "DimIn1" dimIn1
            , mkDim "DimIn0" dimIn0 ])
            (mkNodeInfo (initPos skel) (Name 0))


--------------------------------------------------------------------------------
-- Scan
--------------------------------------------------------------------------------

-- TODO: use a fast scan for primitive types
--
mkExclusiveScan :: Bool -> Bool -> [CType] -> [CExpr] -> [CExpr] -> CUTranslSkel
mkExclusiveScan isReverse isHaskellStyle ty identity apply = CUTranslSkel code defs skel
  where
    skel = "scan.inl"
    defs = [(internalIdent "REVERSE",       Just (fromBool isReverse))
           ,(internalIdent "HASKELL_STYLE", Just (fromBool isHaskellStyle))]
    code = CTranslUnit
            ( mkTupleTypeAsc 2 ty ++
            [ mkIdentity identity
            , mkApply 2 apply ])
            (mkNodeInfo (initPos (takeFileName skel)) (Name 0))

mkInclusiveScan :: Bool -> [CType] -> [CExpr] -> CUTranslSkel
mkInclusiveScan isReverse ty apply = CUTranslSkel code [rev] skel
  where
    skel = "scan1.inl"
    rev  = (internalIdent "REVERSE", Just (fromBool isReverse))
    code = CTranslUnit
            ( mkTupleTypeAsc 2 ty ++
            [ mkApply 2 apply ])
            (mkNodeInfo (initPos (takeFileName skel)) (Name 0))

mkScanl, mkScanr :: [CType] -> [CExpr] -> [CExpr] -> CUTranslSkel
mkScanl = mkExclusiveScan False True
mkScanr = mkExclusiveScan True  True

mkScanl', mkScanr' :: [CType] -> [CExpr] -> [CExpr] -> CUTranslSkel
mkScanl' = mkExclusiveScan False False
mkScanr' = mkExclusiveScan True  False

mkScanl1, mkScanr1 :: [CType] -> [CExpr] -> CUTranslSkel
mkScanl1 = mkInclusiveScan False
mkScanr1 = mkInclusiveScan True


--------------------------------------------------------------------------------
-- Permutation
--------------------------------------------------------------------------------

mkPermute :: [CType] -> Int -> Int -> [CExpr] -> [CExpr] -> CUTranslSkel
mkPermute ty dimOut dimIn0 combinefn indexfn = CUTranslSkel code [] skel
  where
    skel = "permute.inl"
    code = CTranslUnit
            ( mkTupleTypeAsc 2 ty ++
            [ mkDim "DimOut" dimOut
            , mkDim "DimIn0" dimIn0
            , mkProject Forward indexfn
            , mkApply 2 combinefn ])
            (mkNodeInfo (initPos skel) (Name 0))

mkBackpermute :: [CType] -> Int -> Int -> [CExpr] -> CUTranslSkel
mkBackpermute ty dimOut dimIn0 indexFn = CUTranslSkel code [] skel
  where
    skel = "backpermute.inl"
    code = CTranslUnit
            ( mkTupleTypeAsc 1 ty ++
            [ mkDim "DimOut" dimOut
            , mkDim "DimIn0" dimIn0
            , mkProject Backward indexFn ])
            (mkNodeInfo (initPos skel) (Name 0))


--------------------------------------------------------------------------------
-- Multidimensional Index and Replicate
--------------------------------------------------------------------------------

mkIndex :: [CType] -> Int -> Int -> Int -> [CExpr] -> CUTranslSkel
mkIndex ty dimSl dimCo dimIn0 slix = CUTranslSkel code [] skel
  where
    skel = "slice.inl"
    code = CTranslUnit
            ( mkTupleTypeAsc 1 ty ++
            [ mkDim "Slice"    dimSl
            , mkDim "CoSlice"  dimCo
            , mkDim "SliceDim" dimIn0
            , mkSliceIndex slix ])
            (mkNodeInfo (initPos skel) (Name 0))


mkReplicate :: [CType] -> Int -> Int -> [CExpr] -> CUTranslSkel
mkReplicate ty dimSl dimOut slix = CUTranslSkel code [] skel
  where
    skel = "replicate.inl"
    code = CTranslUnit
	    ( mkTupleTypeAsc 1 ty ++
	    [ mkDim "Slice"    dimSl
	    , mkDim "SliceDim" dimOut
	    , mkSliceReplicate slix ])
	    (mkNodeInfo (initPos skel) (Name 0))

