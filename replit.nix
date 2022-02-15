{ pkgs }: {
    deps = [
        pkgs.cowsay
        pkgs.vim
        pkgs.gh
        pkgs.go_1_17
        pkgs.gopls
        pkgs.buf
        pkgs.less
        pkgs.postgresql
    ];
}