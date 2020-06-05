<?php
declare(strict_types=1);

use Hook\Http\Header;

class LogoutController extends Base\ApiController
{
    public function getAction()
    {
        session_destroy();
        self::send();
    }
}