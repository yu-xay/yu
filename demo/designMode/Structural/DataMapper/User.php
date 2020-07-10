<?php declare(strict_types=1);

namespace DesignMode\Creational\DataMapper;

class User
{
    private string $username;
    private string $email;

    public static function fromState(array $state): User
    {
        // 在访问密钥之前验证状态！

        return new self(
            $state['username'],
            $state['email']
        );
    }

    public function __construct(string $username, string $email)
    {
        echo 111;
        // 在设置参数之前，请先对其进行验证！

        $this->username = $username;
        $this->email = $email;
    }

    public function getUsername(): string
    {
        return $this->username;
    }

    public function getEmail(): string
    {
        return $this->email;
    }
}
