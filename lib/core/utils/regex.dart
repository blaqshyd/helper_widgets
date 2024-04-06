// ***  Regex Patterns ***

// This pattern only takes special characters
const specialChar = r'[!@#\$%^&*(),.?":{}|<>]';

// This pattern only takes lowercase and digits
const usernamePattern = r'^[a-z0-9_-]{3,15}$';

const emojiPattern = r'[\u{1F600}-\u{1F64F}'
    r'\u{1F300}-\u{1F5FF}'
    r'\u{1F680}-\u{1F6FF}'
    r'\u{2600}-\u{26FF}'
    r'\u{2700}-\u{27BF}'
    r'\u{1F900}-\u{1F9FF}'
    r'\u{1F1E6}-\u{1F1FF}'
    r'\u{1F191}-\u{1F251}'
    ']+';

const numPattern = r"^\+234[789][01]\d{8}$"
    r"^(?:\+234\s?|0)([789]\d{2})[-\s]?(\d{3})[-\s]?(\d{4})$"
    r"^(?:(?:\+234)|(0)|(\+234))(?:(?:(?:(7[01])|(8[01]))\d{7})|(?:(?:(7[01])|(8[01]))[-\s]?\d{3}[-\s]?\d{4}))(?![\d-])$";

const emailPattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
    r'+/=?^_`{|}~-]+)|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])")@(?:(?:[a-z0-9](?:[a-z0-9-]'
    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

const emailPattern2 = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
