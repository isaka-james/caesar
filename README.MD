# Caesar Cipher Decryption Tool

A simple command-line tool for decrypting Caesar cipher-encrypted text. This tool can automatically search for the correct key by trying all possible shifts from -26 to +26 and stops once it finds a specified target variable in the decrypted text.

## Installation

To install the tool on Kali Linux, use the provided `install.sh` script. Run the following command in your terminal:

```bash
sudo bash install.sh
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

## Installation Script (`install.sh`)

Ensure your `install.sh` script builds and installs the Rust project correctly. The script should compile the Rust project and copy the resulting binary to a directory in your PATH, such as `/usr/local/bin`.

## Summary

This tool is designed to help you decrypt Caesar cipher text efficiently, either by specifying the necessary parameters directly in the command line or through interactive prompts. It's particularly useful for CTF challenges and learning more about classical encryption techniques.