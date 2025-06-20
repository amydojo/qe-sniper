import Link from 'next/link';

export default function Home() {
  return (
    <div style={{padding:'2rem',fontFamily:'Arial'}}>
      <h1>🐾 Josh's QE Command Center</h1>
      <ul>
        <li><Link href='/practice'>Practice Exams</Link></li>
        <li><Link href='/quiz'>Flashcards / Quiz</Link></li>
      </ul>
      <p>XP: 0 | Streak: 0 days</p>
    </div>
  )
}
