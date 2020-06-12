<?php
declare(strict_types=1);

namespace Base;
use Hook\Http\Header;

abstract class AbstractController extends \Yaf\Controller_Abstract
{
    public function init()
    {
        
    }

    public static function send($data = [], int $code = 10000, string $msg = '', int $status = 200)
    {
        Header::setCharset();
        Header::setStatus($status);
        exit(json_encode(['id' => mt_rand(), 'code' => $code, 'msg' => $msg, 'status' => $status, 'data' => $data], JSON_UNESCAPED_UNICODE));
    }
}