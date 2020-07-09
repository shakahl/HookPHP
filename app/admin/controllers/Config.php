<?php
declare(strict_types=1);

class ConfigController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'key'],
        ['field' => 'value'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}