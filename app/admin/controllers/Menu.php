<?php
declare(strict_types=1);

class MenuController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'icon'],
        ['field' => 'parent'],
        ['field' => 'name'],
        ['field' => 'url'],
        ['field' => 'position'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}