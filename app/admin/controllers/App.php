<?php
declare(strict_types=1);

class AppController extends Base\ViewController
{
    public array $cols = [
        ['field' => 'id'],
        ['field' => 'key'],
        ['field' => 'title'],
        ['field' => 'description'],
        ['field' => 'status'],
        ['field' => 'date_add'],
        ['field' => 'date_upd'],
    ];
}