{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_Win32_network (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "Win32_network"
version :: Version
version = Version [0,2,0,0] []

synopsis :: String
synopsis = "Win32 network API"
copyright :: String
copyright = "2019-2023 Input Output Global Inc (IOG), 2023-2024 Intersect"
homepage :: String
homepage = ""
