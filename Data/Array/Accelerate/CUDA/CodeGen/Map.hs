-- |
-- Module      : Data.Array.Accelerate.CUDA.CodeGen.Map
-- Copyright   : [2008..2010] Manuel M T Chakravarty, Gabriele Keller, Sean Lee
-- License     : BSD3
--
-- Maintainer  : Manuel M T Chakravarty <chak@cse.unsw.edu.au>
-- Stability   : experimental
-- Portability : non-partable (GHC extensions)
--
-- Device code for zipWith_k class of functions
--

module Data.Array.Accelerate.CUDA.CodeGen.Map (map, zipWith)
  where

import Prelude hiding (map, zipWith)

import Language.C
import Language.C.Data.Ident


-- Automatically generated
-- ~~~~~~~~~~~~~~~~~~~~~~~
--
map :: String -> CExtDecl
map name =
  CFDefExt (CFunDef ((:) (CTypeQual (CAttrQual (CAttr (Ident "global" (207367368) (NodeInfo (Position "map.c" (23) (16)) (Name (6614)))) ([]) (NodeInfo (Position "map.c" (23) (16)) (Name (6615)))))) ((:) (CTypeSpec (CVoidType (NodeInfo (Position "map.c" (23) (25)) (Name (6617))))) ([]))) (CDeclr (Just (Ident name (1847533) (NodeInfo (Position "map.c" (24) (1)) (Name (6616))))) ((:) (CFunDeclr (Right ((,) ((:) (CDecl ((:) (CTypeSpec (CTypeDef (Ident "TyOut" (246676808) (NodeInfo (Position "map.c" (26) (5)) (Name (6619)))) (NodeInfo (Position "map.c" (26) (5)) (Name (6620))))) ([])) ((:) ((,,) (Just (CDeclr (Just (Ident "d_out" (247197784) (NodeInfo (Position "map.c" (26) (12)) (Name (6621))))) ((:) (CPtrDeclr ([]) (NodeInfo (Position "map.c" (26) (11)) (Name (6623)))) ([])) (Nothing) ([]) (NodeInfo (Position "map.c" (26) (12)) (Name (6622))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "map.c" (26) (5)) (Name (6624)))) ((:) (CDecl ((:) (CTypeQual (CConstQual (NodeInfo (Position "map.c" (27) (5)) (Name (6626))))) ((:) (CTypeSpec (CTypeDef (Ident "TyIn0" (231898372) (NodeInfo (Position "map.c" (27) (11)) (Name (6625)))) (NodeInfo (Position "map.c" (27) (11)) (Name (6627))))) ([]))) ((:) ((,,) (Just (CDeclr (Just (Ident "d_in0" (232419348) (NodeInfo (Position "map.c" (27) (18)) (Name (6628))))) ((:) (CPtrDeclr ([]) (NodeInfo (Position "map.c" (27) (17)) (Name (6630)))) ([])) (Nothing) ([]) (NodeInfo (Position "map.c" (27) (18)) (Name (6629))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "map.c" (27) (5)) (Name (6631)))) ((:) (CDecl ((:) (CTypeQual (CConstQual (NodeInfo (Position "map.c" (28) (5)) (Name (6632))))) ((:) (CTypeSpec (CUnsigType (NodeInfo (Position "map.c" (28) (11)) (Name (6633))))) ((:) (CTypeSpec (CIntType (NodeInfo (Position "map.c" (28) (20)) (Name (6635))))) ([])))) ((:) ((,,) (Just (CDeclr (Just (Ident "length" (217835360) (NodeInfo (Position "map.c" (28) (24)) (Name (6634))))) ([]) (Nothing) ([]) (NodeInfo (Position "map.c" (28) (24)) (Name (6636))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "map.c" (28) (5)) (Name (6637)))) ([])))) (False))) ([]) (NodeInfo (Position "map.c" (25) (1)) (Name (6638)))) ([])) (Nothing) ([]) (NodeInfo (Position "map.c" (24) (1)) (Name (6618)))) ([]) (CCompound ([]) ((:) (CBlockDecl (CDecl ((:) (CTypeSpec (CUnsigType (NodeInfo (Position "map.c" (31) (5)) (Name (6639))))) ((:) (CTypeSpec (CIntType (NodeInfo (Position "map.c" (31) (14)) (Name (6641))))) ([]))) ((:) ((,,) (Just (CDeclr (Just (Ident "idx" (1978985) (NodeInfo (Position "map.c" (31) (18)) (Name (6640))))) ([]) (Nothing) ([]) (NodeInfo (Position "map.c" (31) (18)) (Name (6642))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "map.c" (31) (5)) (Name (6643))))) ((:) (CBlockDecl (CDecl ((:) (CTypeQual (CConstQual (NodeInfo (Position "map.c" (32) (5)) (Name (6644))))) ((:) (CTypeSpec (CUnsigType (NodeInfo (Position "map.c" (32) (11)) (Name (6645))))) ((:) (CTypeSpec (CIntType (NodeInfo (Position "map.c" (32) (20)) (Name (6647))))) ([])))) ((:) ((,,) (Just (CDeclr (Just (Ident "gridSize" (425274938) (NodeInfo (Position "map.c" (32) (24)) (Name (6646))))) ([]) (Nothing) ([]) (NodeInfo (Position "map.c" (32) (24)) (Name (6648))))) (Just (CInitExpr (CCall (CVar (Ident "__umul24" (340403796) (NodeInfo (Position "map.c" (32) (35)) (Name (6649)))) (NodeInfo (Position "map.c" (32) (35)) (Name (6650)))) ((:) (CMember (CVar (Ident "blockDim" (439769293) (NodeInfo (Position "map.c" (32) (44)) (Name (6651)))) (NodeInfo (Position "map.c" (32) (44)) (Name (6652)))) (Ident "x" (120) (NodeInfo (Position "map.c" (32) (53)) (Name (6653)))) (False) (NodeInfo (Position "map.c" (32) (52)) (Name (6654)))) ((:) (CMember (CVar (Ident "gridDim" (213249579) (NodeInfo (Position "map.c" (32) (56)) (Name (6655)))) (NodeInfo (Position "map.c" (32) (56)) (Name (6656)))) (Ident "x" (120) (NodeInfo (Position "map.c" (32) (64)) (Name (6657)))) (False) (NodeInfo (Position "map.c" (32) (63)) (Name (6658)))) ([]))) (NodeInfo (Position "map.c" (32) (43)) (Name (6659)))) (NodeInfo (Position "map.c" (32) (43)) (Name (6660))))) (Nothing)) ([])) (NodeInfo (Position "map.c" (32) (5)) (Name (6661))))) ((:) (CBlockStmt (CFor (Left (Just (CAssign (CAssignOp) (CVar (Ident "idx" (1978985) (NodeInfo (Position "map.c" (34) (10)) (Name (6662)))) (NodeInfo (Position "map.c" (34) (10)) (Name (6663)))) (CBinary (CAddOp) (CCall (CVar (Ident "__umul24" (340403796) (NodeInfo (Position "map.c" (34) (16)) (Name (6664)))) (NodeInfo (Position "map.c" (34) (16)) (Name (6665)))) ((:) (CMember (CVar (Ident "blockDim" (439769293) (NodeInfo (Position "map.c" (34) (25)) (Name (6666)))) (NodeInfo (Position "map.c" (34) (25)) (Name (6667)))) (Ident "x" (120) (NodeInfo (Position "map.c" (34) (34)) (Name (6668)))) (False) (NodeInfo (Position "map.c" (34) (33)) (Name (6669)))) ((:) (CMember (CVar (Ident "blockIdx" (462756685) (NodeInfo (Position "map.c" (34) (37)) (Name (6670)))) (NodeInfo (Position "map.c" (34) (37)) (Name (6671)))) (Ident "x" (120) (NodeInfo (Position "map.c" (34) (46)) (Name (6672)))) (False) (NodeInfo (Position "map.c" (34) (45)) (Name (6673)))) ([]))) (NodeInfo (Position "map.c" (34) (24)) (Name (6674)))) (CMember (CVar (Ident "threadIdx" (424617805) (NodeInfo (Position "map.c" (34) (51)) (Name (6675)))) (NodeInfo (Position "map.c" (34) (51)) (Name (6676)))) (Ident "x" (120) (NodeInfo (Position "map.c" (34) (61)) (Name (6677)))) (False) (NodeInfo (Position "map.c" (34) (60)) (Name (6678)))) (NodeInfo (Position "map.c" (34) (49)) (Name (6679)))) (NodeInfo (Position "map.c" (34) (14)) (Name (6680)))))) (Just (CBinary (CLeOp) (CVar (Ident "idx" (1978985) (NodeInfo (Position "map.c" (34) (64)) (Name (6681)))) (NodeInfo (Position "map.c" (34) (64)) (Name (6682)))) (CVar (Ident "length" (217835360) (NodeInfo (Position "map.c" (34) (70)) (Name (6683)))) (NodeInfo (Position "map.c" (34) (70)) (Name (6684)))) (NodeInfo (Position "map.c" (34) (68)) (Name (6685))))) (Just (CAssign (CAddAssOp) (CVar (Ident "idx" (1978985) (NodeInfo (Position "map.c" (34) (78)) (Name (6686)))) (NodeInfo (Position "map.c" (34) (78)) (Name (6687)))) (CVar (Ident "gridSize" (425274938) (NodeInfo (Position "map.c" (34) (85)) (Name (6688)))) (NodeInfo (Position "map.c" (34) (85)) (Name (6689)))) (NodeInfo (Position "map.c" (34) (82)) (Name (6690))))) (CCompound ([]) ((:) (CBlockStmt (CExpr (Just (CAssign (CAssignOp) (CIndex (CVar (Ident "d_out" (247197784) (NodeInfo (Position "map.c" (36) (9)) (Name (6691)))) (NodeInfo (Position "map.c" (36) (9)) (Name (6692)))) (CVar (Ident "idx" (1978985) (NodeInfo (Position "map.c" (36) (15)) (Name (6693)))) (NodeInfo (Position "map.c" (36) (15)) (Name (6694)))) (NodeInfo (Position "map.c" (36) (14)) (Name (6695)))) (CCall (CVar (Ident "apply" (228341978) (NodeInfo (Position "map.c" (36) (22)) (Name (6696)))) (NodeInfo (Position "map.c" (36) (22)) (Name (6697)))) ((:) (CIndex (CVar (Ident "d_in0" (232419348) (NodeInfo (Position "map.c" (36) (28)) (Name (6698)))) (NodeInfo (Position "map.c" (36) (28)) (Name (6699)))) (CVar (Ident "idx" (1978985) (NodeInfo (Position "map.c" (36) (34)) (Name (6700)))) (NodeInfo (Position "map.c" (36) (34)) (Name (6701)))) (NodeInfo (Position "map.c" (36) (33)) (Name (6702)))) ([])) (NodeInfo (Position "map.c" (36) (27)) (Name (6703)))) (NodeInfo (Position "map.c" (36) (20)) (Name (6704))))) (NodeInfo (Position "map.c" (36) (20)) (Name (6705))))) ([])) (NodeInfo (Position "map.c" (35) (5)) (Name (6706)))) (NodeInfo (Position "map.c" (34) (5)) (Name (6707))))) ([])))) (NodeInfo (Position "map.c" (30) (1)) (Name (6708)))) (NodeInfo (Position "map.c" (23) (16)) (Name (6709))))

zipWith :: String -> CExtDecl
zipWith name =
  CFDefExt (CFunDef ((:) (CTypeQual (CAttrQual (CAttr (Ident "global" (207367368) (NodeInfo (Position "zipwith.c" (24) (16)) (Name (6629)))) ([]) (NodeInfo (Position "zipwith.c" (24) (16)) (Name (6630)))))) ((:) (CTypeSpec (CVoidType (NodeInfo (Position "zipwith.c" (24) (25)) (Name (6632))))) ([]))) (CDeclr (Just (Ident name (186019683) (NodeInfo (Position "zipwith.c" (25) (1)) (Name (6631))))) ((:) (CFunDeclr (Right ((,) ((:) (CDecl ((:) (CTypeSpec (CTypeDef (Ident "TyOut" (246676808) (NodeInfo (Position "zipwith.c" (27) (5)) (Name (6634)))) (NodeInfo (Position "zipwith.c" (27) (5)) (Name (6635))))) ([])) ((:) ((,,) (Just (CDeclr (Just (Ident "d_out" (247197784) (NodeInfo (Position "zipwith.c" (27) (12)) (Name (6636))))) ((:) (CPtrDeclr ([]) (NodeInfo (Position "zipwith.c" (27) (11)) (Name (6638)))) ([])) (Nothing) ([]) (NodeInfo (Position "zipwith.c" (27) (12)) (Name (6637))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "zipwith.c" (27) (5)) (Name (6639)))) ((:) (CDecl ((:) (CTypeQual (CConstQual (NodeInfo (Position "zipwith.c" (28) (5)) (Name (6641))))) ((:) (CTypeSpec (CTypeDef (Ident "TyIn0" (231898372) (NodeInfo (Position "zipwith.c" (28) (11)) (Name (6640)))) (NodeInfo (Position "zipwith.c" (28) (11)) (Name (6642))))) ([]))) ((:) ((,,) (Just (CDeclr (Just (Ident "d_in0" (232419348) (NodeInfo (Position "zipwith.c" (28) (18)) (Name (6643))))) ((:) (CPtrDeclr ([]) (NodeInfo (Position "zipwith.c" (28) (17)) (Name (6645)))) ([])) (Nothing) ([]) (NodeInfo (Position "zipwith.c" (28) (18)) (Name (6644))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "zipwith.c" (28) (5)) (Name (6646)))) ((:) (CDecl ((:) (CTypeQual (CConstQual (NodeInfo (Position "zipwith.c" (29) (5)) (Name (6648))))) ((:) (CTypeSpec (CTypeDef (Ident "TyIn1" (231898373) (NodeInfo (Position "zipwith.c" (29) (11)) (Name (6647)))) (NodeInfo (Position "zipwith.c" (29) (11)) (Name (6649))))) ([]))) ((:) ((,,) (Just (CDeclr (Just (Ident "d_in1" (232419349) (NodeInfo (Position "zipwith.c" (29) (18)) (Name (6650))))) ((:) (CPtrDeclr ([]) (NodeInfo (Position "zipwith.c" (29) (17)) (Name (6652)))) ([])) (Nothing) ([]) (NodeInfo (Position "zipwith.c" (29) (18)) (Name (6651))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "zipwith.c" (29) (5)) (Name (6653)))) ((:) (CDecl ((:) (CTypeQual (CConstQual (NodeInfo (Position "zipwith.c" (30) (5)) (Name (6654))))) ((:) (CTypeSpec (CUnsigType (NodeInfo (Position "zipwith.c" (30) (11)) (Name (6655))))) ((:) (CTypeSpec (CIntType (NodeInfo (Position "zipwith.c" (30) (20)) (Name (6657))))) ([])))) ((:) ((,,) (Just (CDeclr (Just (Ident "length" (217835360) (NodeInfo (Position "zipwith.c" (30) (24)) (Name (6656))))) ([]) (Nothing) ([]) (NodeInfo (Position "zipwith.c" (30) (24)) (Name (6658))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "zipwith.c" (30) (5)) (Name (6659)))) ([]))))) (False))) ([]) (NodeInfo (Position "zipwith.c" (26) (1)) (Name (6660)))) ([])) (Nothing) ([]) (NodeInfo (Position "zipwith.c" (25) (1)) (Name (6633)))) ([]) (CCompound ([]) ((:) (CBlockDecl (CDecl ((:) (CTypeSpec (CUnsigType (NodeInfo (Position "zipwith.c" (33) (5)) (Name (6661))))) ((:) (CTypeSpec (CIntType (NodeInfo (Position "zipwith.c" (33) (14)) (Name (6663))))) ([]))) ((:) ((,,) (Just (CDeclr (Just (Ident "idx" (1978985) (NodeInfo (Position "zipwith.c" (33) (18)) (Name (6662))))) ([]) (Nothing) ([]) (NodeInfo (Position "zipwith.c" (33) (18)) (Name (6664))))) (Nothing) (Nothing)) ([])) (NodeInfo (Position "zipwith.c" (33) (5)) (Name (6665))))) ((:) (CBlockDecl (CDecl ((:) (CTypeQual (CConstQual (NodeInfo (Position "zipwith.c" (34) (5)) (Name (6666))))) ((:) (CTypeSpec (CUnsigType (NodeInfo (Position "zipwith.c" (34) (11)) (Name (6667))))) ((:) (CTypeSpec (CIntType (NodeInfo (Position "zipwith.c" (34) (20)) (Name (6669))))) ([])))) ((:) ((,,) (Just (CDeclr (Just (Ident "gridSize" (425274938) (NodeInfo (Position "zipwith.c" (34) (24)) (Name (6668))))) ([]) (Nothing) ([]) (NodeInfo (Position "zipwith.c" (34) (24)) (Name (6670))))) (Just (CInitExpr (CCall (CVar (Ident "__umul24" (340403796) (NodeInfo (Position "zipwith.c" (34) (35)) (Name (6671)))) (NodeInfo (Position "zipwith.c" (34) (35)) (Name (6672)))) ((:) (CMember (CVar (Ident "blockDim" (439769293) (NodeInfo (Position "zipwith.c" (34) (44)) (Name (6673)))) (NodeInfo (Position "zipwith.c" (34) (44)) (Name (6674)))) (Ident "x" (120) (NodeInfo (Position "zipwith.c" (34) (53)) (Name (6675)))) (False) (NodeInfo (Position "zipwith.c" (34) (52)) (Name (6676)))) ((:) (CMember (CVar (Ident "gridDim" (213249579) (NodeInfo (Position "zipwith.c" (34) (56)) (Name (6677)))) (NodeInfo (Position "zipwith.c" (34) (56)) (Name (6678)))) (Ident "x" (120) (NodeInfo (Position "zipwith.c" (34) (64)) (Name (6679)))) (False) (NodeInfo (Position "zipwith.c" (34) (63)) (Name (6680)))) ([]))) (NodeInfo (Position "zipwith.c" (34) (43)) (Name (6681)))) (NodeInfo (Position "zipwith.c" (34) (43)) (Name (6682))))) (Nothing)) ([])) (NodeInfo (Position "zipwith.c" (34) (5)) (Name (6683))))) ((:) (CBlockStmt (CFor (Left (Just (CAssign (CAssignOp) (CVar (Ident "idx" (1978985) (NodeInfo (Position "zipwith.c" (36) (10)) (Name (6684)))) (NodeInfo (Position "zipwith.c" (36) (10)) (Name (6685)))) (CBinary (CAddOp) (CCall (CVar (Ident "__umul24" (340403796) (NodeInfo (Position "zipwith.c" (36) (16)) (Name (6686)))) (NodeInfo (Position "zipwith.c" (36) (16)) (Name (6687)))) ((:) (CMember (CVar (Ident "blockDim" (439769293) (NodeInfo (Position "zipwith.c" (36) (25)) (Name (6688)))) (NodeInfo (Position "zipwith.c" (36) (25)) (Name (6689)))) (Ident "x" (120) (NodeInfo (Position "zipwith.c" (36) (34)) (Name (6690)))) (False) (NodeInfo (Position "zipwith.c" (36) (33)) (Name (6691)))) ((:) (CMember (CVar (Ident "blockIdx" (462756685) (NodeInfo (Position "zipwith.c" (36) (37)) (Name (6692)))) (NodeInfo (Position "zipwith.c" (36) (37)) (Name (6693)))) (Ident "x" (120) (NodeInfo (Position "zipwith.c" (36) (46)) (Name (6694)))) (False) (NodeInfo (Position "zipwith.c" (36) (45)) (Name (6695)))) ([]))) (NodeInfo (Position "zipwith.c" (36) (24)) (Name (6696)))) (CMember (CVar (Ident "threadIdx" (424617805) (NodeInfo (Position "zipwith.c" (36) (51)) (Name (6697)))) (NodeInfo (Position "zipwith.c" (36) (51)) (Name (6698)))) (Ident "x" (120) (NodeInfo (Position "zipwith.c" (36) (61)) (Name (6699)))) (False) (NodeInfo (Position "zipwith.c" (36) (60)) (Name (6700)))) (NodeInfo (Position "zipwith.c" (36) (49)) (Name (6701)))) (NodeInfo (Position "zipwith.c" (36) (14)) (Name (6702)))))) (Just (CBinary (CLeOp) (CVar (Ident "idx" (1978985) (NodeInfo (Position "zipwith.c" (36) (64)) (Name (6703)))) (NodeInfo (Position "zipwith.c" (36) (64)) (Name (6704)))) (CVar (Ident "length" (217835360) (NodeInfo (Position "zipwith.c" (36) (70)) (Name (6705)))) (NodeInfo (Position "zipwith.c" (36) (70)) (Name (6706)))) (NodeInfo (Position "zipwith.c" (36) (68)) (Name (6707))))) (Just (CAssign (CAddAssOp) (CVar (Ident "idx" (1978985) (NodeInfo (Position "zipwith.c" (36) (78)) (Name (6708)))) (NodeInfo (Position "zipwith.c" (36) (78)) (Name (6709)))) (CVar (Ident "gridSize" (425274938) (NodeInfo (Position "zipwith.c" (36) (85)) (Name (6710)))) (NodeInfo (Position "zipwith.c" (36) (85)) (Name (6711)))) (NodeInfo (Position "zipwith.c" (36) (82)) (Name (6712))))) (CCompound ([]) ((:) (CBlockStmt (CExpr (Just (CAssign (CAssignOp) (CIndex (CVar (Ident "d_out" (247197784) (NodeInfo (Position "zipwith.c" (38) (9)) (Name (6713)))) (NodeInfo (Position "zipwith.c" (38) (9)) (Name (6714)))) (CVar (Ident "idx" (1978985) (NodeInfo (Position "zipwith.c" (38) (15)) (Name (6715)))) (NodeInfo (Position "zipwith.c" (38) (15)) (Name (6716)))) (NodeInfo (Position "zipwith.c" (38) (14)) (Name (6717)))) (CCall (CVar (Ident "apply" (228341978) (NodeInfo (Position "zipwith.c" (38) (22)) (Name (6718)))) (NodeInfo (Position "zipwith.c" (38) (22)) (Name (6719)))) ((:) (CIndex (CVar (Ident "d_in0" (232419348) (NodeInfo (Position "zipwith.c" (38) (28)) (Name (6720)))) (NodeInfo (Position "zipwith.c" (38) (28)) (Name (6721)))) (CVar (Ident "idx" (1978985) (NodeInfo (Position "zipwith.c" (38) (34)) (Name (6722)))) (NodeInfo (Position "zipwith.c" (38) (34)) (Name (6723)))) (NodeInfo (Position "zipwith.c" (38) (33)) (Name (6724)))) ((:) (CIndex (CVar (Ident "d_in1" (232419349) (NodeInfo (Position "zipwith.c" (38) (40)) (Name (6725)))) (NodeInfo (Position "zipwith.c" (38) (40)) (Name (6726)))) (CVar (Ident "idx" (1978985) (NodeInfo (Position "zipwith.c" (38) (46)) (Name (6727)))) (NodeInfo (Position "zipwith.c" (38) (46)) (Name (6728)))) (NodeInfo (Position "zipwith.c" (38) (45)) (Name (6729)))) ([]))) (NodeInfo (Position "zipwith.c" (38) (27)) (Name (6730)))) (NodeInfo (Position "zipwith.c" (38) (20)) (Name (6731))))) (NodeInfo (Position "zipwith.c" (38) (20)) (Name (6732))))) ([])) (NodeInfo (Position "zipwith.c" (37) (5)) (Name (6733)))) (NodeInfo (Position "zipwith.c" (36) (5)) (Name (6734))))) ([])))) (NodeInfo (Position "zipwith.c" (32) (1)) (Name (6735)))) (NodeInfo (Position "zipwith.c" (24) (16)) (Name (6736))))
