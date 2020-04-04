{-# LANGUAGE CPP        #-}
{-# LANGUAGE RankNTypes #-}

-- we are exporting `Void` with constructors
{-# OPTIONS_GHC -Wno-dodgy-exports #-}

-- | A shim layer for `Win32-network`'s `IOManager`
--
module System.IOManager
  ( WithIOManager
  , IOManager (..)
  , IOManagerError (..)
  , withIOManager

  -- * Deprecated API
  , AssociateWithIOCP
  , associateWithIOCP
  ) where


#if defined(mingw32_HOST_OS)
import System.Win32.Types (HANDLE)
import qualified System.Win32.Async.IOManager as Win32.Async
import Network.Socket (Socket)
#else
import Data.Void (Void)
#endif

#if defined(mingw32_HOST_OS)
type IOManagerError = Win32.Async.IOManagerError
#else
type IOManagerError = Void
#endif

-- | This is public api to interact with the io manager; On Windows 'IOManager'
-- holds 'System.Win32.Async.IOManager.associateWithIOCompletionPort';
-- on other platforms 'IOManager' can run over any type, and thus is
-- guaranteed to be no-op.
--
#if defined(mingw32_HOST_OS)
newtype IOManager = IOManager {
    associateWithIOManager :: Either HANDLE Socket -> IO ()
  }

associateWithIOCP :: IOManager -> Either HANDLE Socket -> IO ()
associateWithIOCP = associateWithIOManager

#else
newtype IOManager = IOManager {
    associateWithIOManager :: forall hole. hole -> IO ()
  }

associateWithIOCP :: forall hole. IOManager -> hole -> IO ()
associateWithIOCP = associateWithIOManager
#endif

type AssociateWithIOCP = IOManager
{-# DEPRECATED AssociateWithIOCP "Usage of type alias AssociateWithIOCP is deprecated, use 'IOManager' instead " #-}

{-# DEPRECATED associateWithIOCP "Usage of 'associateWithIOCP' is deprecated, use 'associateWithIOManager' instead." #-}

type WithIOManager = forall a. (IOManager -> IO a) -> IO a


-- | 'withIOManger' must be called only once at the top level.  We wrap the
-- 'associateWithIOCompletionPort' in a newtype wrapper since it will be
-- carried arround through the application.
--
withIOManager :: WithIOManager
#if defined(mingw32_HOST_OS)
withIOManager = \f ->
  Win32.Async.withIOManager $
    \iocp -> f (IOManager $ \fd -> Win32.Async.associateWithIOCompletionPort fd iocp)
#else
withIOManager = \f -> f (IOManager $ \_ -> pure ())
#endif
