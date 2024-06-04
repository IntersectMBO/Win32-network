{-# LINE 1 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
{-# LANGUAGE CPP            #-}
{-# LANGUAGE NamedFieldPuns #-}




module System.Win32.Async.Overlapped
  ( -- * OVERLAPPED
    OVERLAPPED (..)
  , nullOVERLAPPED
  , LPOVERLAPPED

    -- * WSAOVERLAPPED (winsock2)
  , WSAOVERLAPPED (..)
  , nullWSAOVERLAPPED
  , LPWSAOVERLAPPED
  ) where


{-# LINE 20 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
import System.Win32.File ( LPOVERLAPPED, OVERLAPPED (..) )

{-# LINE 22 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
import Foreign (Ptr)
import Foreign.Storable (Storable (..))
import System.Win32.Types



{-# LINE 63 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}

nullOVERLAPPED :: OVERLAPPED
nullOVERLAPPED = OVERLAPPED 0 0 0 0 nullPtr

data WSAOVERLAPPED
  = WSAOVERLAPPED { wsa_internal     :: DWORD
                  , wsa_internalHigh :: DWORD
                  , wsa_offset       :: DWORD
                  , wsa_offsetHigh   :: DWORD
                  , wsa_hEvent       :: HANDLE
                  }

instance Storable WSAOVERLAPPED where
  sizeOf    _ = (32)
{-# LINE 77 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
  alignment _ = (8)
{-# LINE 78 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}

  poke buf ov@WSAOVERLAPPED {wsa_hEvent} = do
    ((\hsc_ptr -> pokeByteOff hsc_ptr 0))     buf (wsa_internal ov)
{-# LINE 81 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ((\hsc_ptr -> pokeByteOff hsc_ptr 8)) buf (wsa_internal ov)
{-# LINE 82 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ((\hsc_ptr -> pokeByteOff hsc_ptr 16))       buf (wsa_offset ov)
{-# LINE 83 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ((\hsc_ptr -> pokeByteOff hsc_ptr 20))   buf (wsa_offsetHigh ov)
{-# LINE 84 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ((\hsc_ptr -> pokeByteOff hsc_ptr 24))       buf wsa_hEvent
{-# LINE 85 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}

  peek buf = do
    wsa_internal     <- ((\hsc_ptr -> peekByteOff hsc_ptr 0))     buf
{-# LINE 88 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    wsa_internalHigh <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) buf
{-# LINE 89 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    wsa_offset       <- ((\hsc_ptr -> peekByteOff hsc_ptr 16))       buf
{-# LINE 90 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    wsa_offsetHigh   <- ((\hsc_ptr -> peekByteOff hsc_ptr 20))   buf
{-# LINE 91 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    wsa_hEvent       <- ((\hsc_ptr -> peekByteOff hsc_ptr 24))       buf
{-# LINE 92 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    return $ WSAOVERLAPPED { wsa_internal
                           , wsa_internalHigh
                           , wsa_offset
                           , wsa_offsetHigh
                           , wsa_hEvent
                           }

type LPWSAOVERLAPPED = Ptr WSAOVERLAPPED

nullWSAOVERLAPPED :: WSAOVERLAPPED
nullWSAOVERLAPPED = WSAOVERLAPPED 0 0 0 0 nullPtr
