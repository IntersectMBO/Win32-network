{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_Win32_network (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\runneradmin\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\runneradmin\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.10.4\\Win32-network-0.1.0.0-inplace"
dynlibdir  = "C:\\Users\\runneradmin\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.10.4"
datadir    = "C:\\Users\\runneradmin\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.10.4\\Win32-network-0.1.0.0"
libexecdir = "C:\\Users\\runneradmin\\AppData\\Roaming\\cabal\\Win32-network-0.1.0.0-inplace\\x86_64-windows-ghc-8.10.4\\Win32-network-0.1.0.0"
sysconfdir = "C:\\Users\\runneradmin\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Win32_network_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Win32_network_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Win32_network_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Win32_network_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Win32_network_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Win32_network_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
