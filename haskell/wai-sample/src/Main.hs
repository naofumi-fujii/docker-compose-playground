{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ByteString.Builder (byteString)
import Control.Monad.IO.Class (liftIO)
import qualified Data.ByteString.Char8 as BS
import Network.HTTP.Types (status200)
import Network.Wai (Application, responseBuilder)
import Network.Wai.Handler.Warp (run)
import Network.Wai.Logger (withStdoutLogger, ApacheLogger)

main :: IO ()
main = withStdoutLogger $ \aplogger ->
    run 3000 $ logApp aplogger

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
