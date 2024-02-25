import md5 from 'md5';

import logo from './logo.svg';

import './App.css';

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
        <p>
          Value: gleryston-matos
          <br></br>
          MD5 01: {
            md5('gleryston-matos').toUpperCase()
          }<br></br>
          MD5 02: {
            md5('gleryston-matos').toUpperCase()
          }
        </p>
      </header>
    </div>
  );
}

export default App;