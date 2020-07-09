<?php
declare(strict_types=1);

class Hook_HookController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'key'],
        ['field' => 'title'],
        ['field' => 'description'],
        ['field' => 'position'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}