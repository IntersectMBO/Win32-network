{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_Win32_network (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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
version = Version [0,2,0,1] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "C:\\cabal\\bin"
libdir     = "C:\\cabal\\x86_64-windows-ghc-8.10.7\\Win32-network-0.2.0.1-inplace"
dynlibdir  = "C:\\cabal\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\cabal\\x86_64-windows-ghc-8.10.7\\Win32-network-0.2.0.1"
libexecdir = "C:\\cabal\\Win32-network-0.2.0.1-inplace\\x86_64-windows-ghc-8.10.7\\Win32-network-0.2.0.1"
sysconfdir = "C:\\cabal\\etc"

getBinDir     = catchIO (getEnv "Win32_network_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "Win32_network_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "Win32_network_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "Win32_network_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Win32_network_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Win32_network_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
