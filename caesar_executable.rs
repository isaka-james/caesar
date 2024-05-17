use std::env;
use std::io;

fn caesar_decrypt(text: &str, key: i32) -> String {
    let mut decrypted = String::new();
    for c in text.chars() {
        if c.is_ascii_alphabetic() {
            let base = if c.is_ascii_lowercase() { b'a' } else { b'A' };
            let shifted = (((c as i32) - base as i32 - key + 26) % 26 + base as i32) as u8;
            decrypted.push(shifted as char);
        } else {
            decrypted.push(c);
        }
    }
    decrypted
}

fn main() {
    let mut args = env::args().skip(1);
    let mut encrypted_text = String::new();
    let mut target_variable = String::new();

    if let Some(flag) = args.next() {
        match flag.as_str() {
            "-d" => {
                if let Some(text) = args.next() {
                    encrypted_text = text;
                } else {
                    println!("Error: Missing encrypted text argument after -d flag.");
                    return;
                }
            },
            _ => {
                println!("Error: Unknown flag {}", flag);
                return;
            },
        }

        if let Some(flag) = args.next() {
            match flag.as_str() {
                "-w" => {
                    if let Some(text) = args.next() {
                        target_variable = text;
                    } else {
                        println!("Error: Missing target variable argument after -w flag.");
                        return;
                    }
                },
                _ => {
                    println!("Error: NOT FOUND {}", flag);
                    return;
                },
            }
        }
    } else {
        println!("Enter the encrypted text:");
        io::stdin().read_line(&mut encrypted_text).expect("Failed to read line");
        encrypted_text = encrypted_text.trim().to_string();

        println!("Enter the target variable:");
        io::stdin().read_line(&mut target_variable).expect("Failed to read line");
        target_variable = target_variable.trim().to_string();
    }

    for key in -26..=26 {
        let decrypted_text = caesar_decrypt(&encrypted_text, key);

        if decrypted_text.contains(&target_variable) {
            println!("\n\nKey found: {}", key);
            println!("Decrypted text: {}", decrypted_text);
            return;
        }
    }

    println!("Key not found.");
}
