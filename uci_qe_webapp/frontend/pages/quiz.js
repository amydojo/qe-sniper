import { useState, useEffect } from 'react';
import axios from 'axios';

export default function Quiz(){
  const [card, setCard] = useState(null);
  const [show, setShow] = useState(false);
  const getCard = async () => {
    const res = await axios.get('http://localhost:8000/flashcard');
    setCard(res.data); setShow(false);
  };
  useEffect(()=>{getCard()},[]);
  if(!card) return <p>Loading...</p>;
  return (
    <div style={{padding:'1rem'}}>
      <h2>Flashcard</h2>
      <p><strong>Q:</strong> {card.question}</p>
      {show? <p><strong>A:</strong> {card.answer}</p>:
       <button onClick={()=>setShow(true)}>Show Answer</button>}
      <br/><button onClick={getCard}>Next Card</button>
    </div>
  );
}
