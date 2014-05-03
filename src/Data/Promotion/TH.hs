{-# LANGUAGE ExplicitNamespaces, CPP #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  Data.Promotion.TH
-- Copyright   :  (C) 2013 Richard Eisenberg
-- License     :  BSD-style (see LICENSE)
-- Maintainer  :  Richard Eisenberg (eir@cis.upenn.edu)
-- Stability   :  experimental
-- Portability :  non-portable
--
-- This module contains everything you need to promote your own functions via
-- Template Haskell.
--
----------------------------------------------------------------------------

module Data.Promotion.TH (
  -- * Primary Template Haskell generation functions
  promote, promoteOnly, genDefunSymbols, genPromotions,

  -- ** Functions to generate equality instances
  promoteEqInstances, promoteEqInstance,

  -- ** Functions to generate Ord instances
  promoteOrdInstances, promoteOrdInstance,

  -- ** defunctionalization
  TyFun, Apply, type (@@),

  -- * Auxiliary definitions
  -- | These definitions might be mentioned in code generated by Template Haskell,
  -- so they must be in scope.

  PEq(..), If, (:&&), SEq(..),
  POrd(..),
  Any,
  Proxy(..), KProxy(..), ThenCmp,

  Error, ErrorSym0,
  TrueSym0, FalseSym0,
  LTSym0, EQSym0, GTSym0,
  Tuple0Sym0,
  Tuple2Sym0, Tuple2Sym1, Tuple2Sym2,
  Tuple3Sym0, Tuple3Sym1, Tuple3Sym2, Tuple3Sym3,
  Tuple4Sym0, Tuple4Sym1, Tuple4Sym2, Tuple4Sym3, Tuple4Sym4,
  Tuple5Sym0, Tuple5Sym1, Tuple5Sym2, Tuple5Sym3, Tuple5Sym4, Tuple5Sym5,
  Tuple6Sym0, Tuple6Sym1, Tuple6Sym2, Tuple6Sym3, Tuple6Sym4, Tuple6Sym5, Tuple6Sym6,
  Tuple7Sym0, Tuple7Sym1, Tuple7Sym2, Tuple7Sym3, Tuple7Sym4, Tuple7Sym5, Tuple7Sym6, Tuple7Sym7,

  SuppressUnusedWarnings(..)

 ) where

import Data.Singletons.Types ( Proxy(..) )
import Data.Singletons
import Data.Singletons.Promote
import Data.Singletons.Prelude.Instances
import Data.Singletons.Prelude.Bool
import Data.Singletons.Prelude.Eq
import Data.Singletons.Prelude.Ord
import Data.Singletons.TypeLits
import Data.Singletons.SuppressUnusedWarnings
import GHC.Exts


