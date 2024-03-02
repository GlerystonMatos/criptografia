import md5 from "md5";
import sha1 from "crypto-js/sha1";
import sha256 from "crypto-js/sha256";
import sha384 from "crypto-js/sha384";
import sha512 from "crypto-js/sha512";
import base64 from "crypto-js/enc-base64";
import hmacSha1 from "crypto-js/hmac-sha1";
import hmacSha256 from "crypto-js/hmac-sha256";

import logo from "./logo.svg";

import "./App.css";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          target="_blank"
          className="App-link"
          href="https://reactjs.org"
          rel="noopener noreferrer">
          Learn React
        </a>
        <p className="App-p">
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          HMAC SHA1 Hex: {
            "0x" + hmacSha1("gleryston-matos", "8dc115f4e2b640f6a2bc4046fdc5c635").toString().toUpperCase()
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          HMAC SHA256 Hex: {
            "0x" + hmacSha256("gleryston-matos", "8dc115f4e2b640f6a2bc4046fdc5c635").toString().toUpperCase()
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          HMAC SHA1 Base64: {
            base64.stringify(hmacSha1("gleryston-matos", "8dc115f4e2b640f6a2bc4046fdc5c635"))
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          HMAC SHA256 Base64: {
            base64.stringify(hmacSha256("gleryston-matos", "8dc115f4e2b640f6a2bc4046fdc5c635"))
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          MD5 01: {
            md5("gleryston-matos").toUpperCase()
          }<br></br>
          MD5 02: {
            md5("gleryston-matos").toUpperCase()
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          SHA1 01: {
            sha1("gleryston-matos").toString().toUpperCase()
          }<br></br>
          SHA1 02: {
            sha1("gleryston-matos").toString().toUpperCase()
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          SHA256 01: {
            sha256("gleryston-matos").toString().toUpperCase()
          }<br></br>
          SHA256 02: {
            sha256("gleryston-matos").toString().toUpperCase()
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          SHA384 01: {
            sha384("gleryston-matos").toString().toUpperCase()
          }<br></br>
          SHA384 02: {
            sha384("gleryston-matos").toString().toUpperCase()
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          <br></br>
          SHA512 01: {
            sha512("gleryston-matos").toString().toUpperCase()
          }<br></br>
          SHA512 02: {
            sha512("gleryston-matos").toString().toUpperCase()
          }<br></br>
          ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        </p>
      </header>
    </div>
  );
}

export default App;