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
version = Version [0,1,1,1] []

synopsis :: String
synopsis = "Win32 network API"
copyright :: String
copyright = "2019-2023 Input Output Global Inc (IOG), Intersect 2024"
homepage :: String
homepage = ""
