openssl s_client -connect 10.14.247.247:443 </dev/null 2>/dev/null | openssl x509  -noout -fingerprint | cut -d "=" -f2

