{-# LINE 1 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}





-- | 'ErrCode's which can appear when working with 'System.Win32.Async'
--
module System.Win32.Async.ErrCode where

import System.Win32.Types (ErrCode, failWith)

-- | This error is thrown by 'GetQueuedCompletionsStatus' when I/O completion
-- port is closed.
--
-- 735
eRROR_ABANDONED_WAIT_0 :: ErrCode
eRROR_ABANDONED_WAIT_0 = 735
{-# LINE 18 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- | Reached the end of file.
--
-- 38
eRROR_HANDLE_EOF :: ErrCode
eRROR_HANDLE_EOF = 38
{-# LINE 24 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- | The 'HANDLE' is invalid.
--
-- 6
eRROR_INVALID_HANDLE :: ErrCode
eRROR_INVALID_HANDLE = 6
{-# LINE 30 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- 232
eRROR_NO_DATA :: ErrCode
eRROR_NO_DATA = 232
{-# LINE 34 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- | Error returned by 'GetQueuedCompletionsStatus' when an I/O operation was
-- cancelled with 'CancelIoEx'.
--
-- 995
eRROR_OPERATION_ABORTED :: ErrCode
eRROR_OPERATION_ABORTED = 995
{-# LINE 41 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- 996
eRROR_IO_INCOMPLETE :: ErrCode
eRROR_IO_INCOMPLETE = 996
{-# LINE 45 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- | For async operations, 'getLastError' reports 'ERROR_IO_PENDING'.  It is
-- not an error per se, but used by the os to notify that the i/o will be
-- completed asynchronously.  For the scope of this library it means that the
-- 'IOManager' thread will be notified when the operation completes.
--
-- 997
eRROR_IO_PENDING :: ErrCode
eRROR_IO_PENDING = 997
{-# LINE 54 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- 535
eRROR_PIPE_CONNECTED :: ErrCode
eRROR_PIPE_CONNECTED = 535
{-# LINE 58 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- 536
eRROR_PIPE_LISTENING :: ErrCode
eRROR_PIPE_LISTENING = 536
{-# LINE 62 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

-- 1168
eRROR_NOT_FOUND :: ErrCode
eRROR_NOT_FOUND = 1168
{-# LINE 66 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

type WSAErrCode = Int

wSA_IO_PENDING :: WSAErrCode
wSA_IO_PENDING = 997
{-# LINE 71 "src\\System\\Win32\\Async\\ErrCode.hsc" #-}

foreign import ccall unsafe "winsock2.hs WSAGetLastError"
    wsaGetLastError :: IO WSAErrCode

-- Accordin to
-- <https://docs.microsoft.com/en-us/windows/win32/api/winsock/nf-winsock-wsagetlasterror>
-- @FormatMessage@ can be used to get 'WSAErrCode' description.
wsaFailWith :: String -> WSAErrCode -> IO a
wsaFailWith fn_name err_code = failWith fn_name (fromIntegral err_code)
