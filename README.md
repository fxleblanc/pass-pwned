# Pass pwned
These scripts automate the process of checking if your password has been pwned. It also includes a utility for gnu-pass users out there.

## pwned.sh
This script checks if the password string given in parameter has been pwned. It uses the haveibeenpwned.com API.
```
./pwned.sh [password]
```

## pass-pwned.sh
This script looks up every file named password in your gnu pass directory. It then decrypts the password and uses the pwned.sh to check if it has been pwned.
```
./pass-pwned.sh
```

## References
- https://haveibeenpwned.com/API/v2#PwnedPasswords
- https://www.passwordstore.org/
