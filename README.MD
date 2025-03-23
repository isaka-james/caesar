# Caesar Cipher Decryption Tool

A simple command-line tool for decrypting Caesar cipher-encrypted text. This tool can automatically search for the correct key by trying all possible shifts from -26 to +26 and stops once it finds a specified target variable in the decrypted text.

## Installation

To install the tool on Kali Linux, use the provided `install.sh` script. Run the following command in your terminal:

```bash
bash install.sh
```

## Usage

You can use the tool in two ways: by providing command-line arguments or by interacting with prompts.

### Example with Command-Line Arguments

You can specify the encrypted text and the target variable directly in the command line:

```bash
┌──(isaka㉿kali)-[~/temp/ctf]
└─$ caesar -d "wpjvJAM{jhlzhy_k3jy9wa3k_i204hkj6}" -w "CTF"
Key found: -19
Decrypted text: picoCTF{caesar_d3cr9pt3d_b204adc6}
```

> You can use that when you only know that before encryption, the plain text contained `CTF` in it, you can use that to many various words out there :)

### Example with Interactive Prompts

You can also run the tool without arguments and it will prompt you to enter the encrypted text and the target variable:

```bash
┌──(isaka㉿kali)-[~/temp/ctf]
└─$ caesar
Enter the encrypted text:
wpjvJAM{jhlzhy_k3jy9wa3k_i204hkj6}
Enter the target variable:
CTF

Key found: -19
Decrypted text: picoCTF{caesar_d3cr9pt3d_b204adc6}
```

## Script Details

- `caesar` is the command to run the decryption tool.
- `-d` flag is used to specify the encrypted text.
- `-w` flag is used to specify the target variable to search for in the decrypted text.
- `-h` or `--help` flag is used to show help and how to use the tool.

## Installation Script (`install.sh`)

`install.sh` script handles all the installation logic, by identifying the appropiate way to install the tool according to your enviroment,such as `~/.local/share"` (for `debian` based users).

> For uninstallation you just type 

```bash
┌──(isaka㉿kali)-[~/temp/ctf]
└─$ caesar uninstall
```

## Summary

This tool is designed to help you decrypt Caesar cipher text efficiently, either by specifying the necessary parameters directly in the command line or through interactive prompts. It's particularly useful for CTF challenges and learning more about classical encryption techniques. And it is very compactible with all most all linux enviroments including Termux.

- If you would like to see its source codes, you can see it [in this commit](https://github.com/isaka-james/caesar/commit/bc8b34ec52aa8034856eb8b0ebd20979082689e9)

<img src="https://komarev.com/ghpvc/?username=caesar-tool&label=Visitors&color=0e75b6&style=flat" alt="since 24 March,2025" />