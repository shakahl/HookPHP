<?php
declare(strict_types=1);

class ThemeController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'key'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}