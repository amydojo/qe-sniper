import { useState } from 'react';
import axios from 'axios';

export default function Practice() {
  const [code, setCode] = useState('// write R code here');
  const [output, setOutput] = useState('');
  const runCode = async () => {
    const res = await axios.post('http://localhost:8000/runCode', code, {
      headers: {'Content-Type':'text/plain'}
    });
    setOutput(res.data.console);
  };
  return (
    <div style={{padding:'1rem'}}>
      <h2>Practice Exam Runner</h2>
      <textarea value={code} onChange={e=>setCode(e.target.value)} rows={10} cols={80}/>
      <br/>
      <button onClick={runCode}>Run</button>
      <pre>{output}</pre>
    </div>
  );
}
