{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ByteString.Builder (byteString)
import Control.Monad.IO.Class (liftIO)
import qualified Data.ByteString.Char8 as BS
import Network.HTTP.Types (status200)
import Network.Wai (Application, responseBuilder)
import Network.Wai.Handler.Warp (run)
import Network.Wai.Logger (withStdoutLogger, ApacheLogger)
import System.Environment

-- http://hackage.haskell.org/package/wai-logger-2.3.6/docs/Network-Wai-Logger.html
main :: IO ()
main = do
  envPort <- getEnv "PORT"
  putStrLn $ "PORT=" ++ show (envPort)
  let port = read envPort :: Int
  withStdoutLogger $ \aplogger ->
    run port $ logApp aplogger

logApp :: ApacheLogger -> Application
logApp aplogger req response = do
    liftIO $ aplogger req status (Just len)
    response $ responseBuilder status hdr msg
  where
    status = status200
    hdr = [("Content-Type", "text/plain")]
    pong = "PONG"
    msg = byteString pong
    len = fromIntegral $ BS.length pong
