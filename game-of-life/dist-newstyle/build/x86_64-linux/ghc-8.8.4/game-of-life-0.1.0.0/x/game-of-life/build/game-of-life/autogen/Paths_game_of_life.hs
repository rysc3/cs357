{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_game_of_life (
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

bindir     = "/home/ryserver/.cabal/bin"
libdir     = "/home/ryserver/.cabal/lib/x86_64-linux-ghc-8.8.4/game-of-life-0.1.0.0-inplace-game-of-life"
dynlibdir  = "/home/ryserver/.cabal/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/ryserver/.cabal/share/x86_64-linux-ghc-8.8.4/game-of-life-0.1.0.0"
libexecdir = "/home/ryserver/.cabal/libexec/x86_64-linux-ghc-8.8.4/game-of-life-0.1.0.0"
sysconfdir = "/home/ryserver/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "game_of_life_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "game_of_life_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "game_of_life_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "game_of_life_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "game_of_life_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "game_of_life_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
