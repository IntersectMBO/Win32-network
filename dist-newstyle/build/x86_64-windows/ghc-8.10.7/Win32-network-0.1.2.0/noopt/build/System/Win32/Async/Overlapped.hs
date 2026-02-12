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


{-# LINE 22 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
import Foreign (Ptr)
import Foreign.Storable (Storable (..))
import System.Win32.Types



{-# LINE 28 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
data OVERLAPPED
  = OVERLAPPED { ovl_internal     :: ULONG_PTR
               , ovl_internalHigh :: ULONG_PTR
               , ovl_offset       :: DWORD
               , ovl_offsetHigh   :: DWORD
               , ovl_hEvent       :: HANDLE
               } deriving (Show)

instance Storable OVERLAPPED where
  sizeOf    _ = (32)
{-# LINE 38 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
  alignment _ = (8)
{-# LINE 39 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}

  poke buf ov@OVERLAPPED {ovl_hEvent} = do
    ((\hsc_ptr -> pokeByteOff hsc_ptr 0))     buf (ovl_internal ov)
{-# LINE 42 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ((\hsc_ptr -> pokeByteOff hsc_ptr 8)) buf (ovl_internal ov)
{-# LINE 43 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ((\hsc_ptr -> pokeByteOff hsc_ptr 16))       buf (ovl_offset ov)
{-# LINE 44 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ((\hsc_ptr -> pokeByteOff hsc_ptr 20))   buf (ovl_offsetHigh ov)
{-# LINE 45 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ((\hsc_ptr -> pokeByteOff hsc_ptr 24))       buf ovl_hEvent
{-# LINE 46 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}

  peek buf = do
    ovl_internal     <- ((\hsc_ptr -> peekByteOff hsc_ptr 0))     buf
{-# LINE 49 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ovl_internalHigh <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) buf
{-# LINE 50 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ovl_offset       <- ((\hsc_ptr -> peekByteOff hsc_ptr 16))       buf
{-# LINE 51 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ovl_offsetHigh   <- ((\hsc_ptr -> peekByteOff hsc_ptr 20))   buf
{-# LINE 52 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    ovl_hEvent       <- ((\hsc_ptr -> peekByteOff hsc_ptr 24))       buf
{-# LINE 53 "src\\System\\Win32\\Async\\Overlapped.hsc" #-}
    return $ OVERLAPPED { ovl_internal
                        , ovl_internalHigh
                        , ovl_offset
                        , ovl_offsetHigh
                        , ovl_hEvent
                        }


type LPOVERLAPPED = Ptr OVERLAPPED

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
