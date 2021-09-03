{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_nimzo (
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

bindir     = "C:\\Users\\laers\\Documents\\GitHub\\Nimzo\\nimzo\\.stack-work\\install\\cef5bcdc\\bin"
libdir     = "C:\\Users\\laers\\Documents\\GitHub\\Nimzo\\nimzo\\.stack-work\\install\\cef5bcdc\\lib\\x86_64-windows-ghc-8.10.6\\nimzo-0.1.0.0-Gzt6yXDssEMFmOiJ0m3NO9-nimzo"
dynlibdir  = "C:\\Users\\laers\\Documents\\GitHub\\Nimzo\\nimzo\\.stack-work\\install\\cef5bcdc\\lib\\x86_64-windows-ghc-8.10.6"
datadir    = "C:\\Users\\laers\\Documents\\GitHub\\Nimzo\\nimzo\\.stack-work\\install\\cef5bcdc\\share\\x86_64-windows-ghc-8.10.6\\nimzo-0.1.0.0"
libexecdir = "C:\\Users\\laers\\Documents\\GitHub\\Nimzo\\nimzo\\.stack-work\\install\\cef5bcdc\\libexec\\x86_64-windows-ghc-8.10.6\\nimzo-0.1.0.0"
sysconfdir = "C:\\Users\\laers\\Documents\\GitHub\\Nimzo\\nimzo\\.stack-work\\install\\cef5bcdc\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "nimzo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "nimzo_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "nimzo_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "nimzo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "nimzo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "nimzo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
