{-# LINE 1 "src\\System\\Win32\\Async\\WSABuf.hsc" #-}
{-# LANGUAGE NamedFieldPuns #-}



module System.Win32.Async.WSABuf
  ( WSABuf (..)
  ) where

import Data.Word (Word8)
import Foreign.Ptr (Ptr)
import Foreign.Storable (Storable (..))
import System.Win32.Types (ULONG)


-- | 'WSABuf' is Haskell representation of 'WSABUF' struct.
--
data WSABuf = WSABuf {
    len :: ULONG,
    buf :: Ptr Word8
  }

instance Storable WSABuf where
    sizeOf _    = (16)
{-# LINE 24 "src\\System\\Win32\\Async\\WSABuf.hsc" #-}
    alignment _ = (8)
{-# LINE 25 "src\\System\\Win32\\Async\\WSABuf.hsc" #-}

    peek p = do
      len <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) p
{-# LINE 28 "src\\System\\Win32\\Async\\WSABuf.hsc" #-}
      buf <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) p
{-# LINE 29 "src\\System\\Win32\\Async\\WSABuf.hsc" #-}
      return $ WSABuf len buf

    poke p WSABuf {len, buf} = do
      ((\hsc_ptr -> pokeByteOff hsc_ptr 0)) p len
{-# LINE 33 "src\\System\\Win32\\Async\\WSABuf.hsc" #-}
      ((\hsc_ptr -> pokeByteOff hsc_ptr 8)) p buf
{-# LINE 34 "src\\System\\Win32\\Async\\WSABuf.hsc" #-}
