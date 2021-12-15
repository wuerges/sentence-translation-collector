import React, { useState } from "react";

export default function SentenceTranslator() {
  const [count, setCount] = useState(0);
  return (
    <div>
      <p>YAY from React: {count}</p>
      <button onClick={() => setCount(count + 1)}>{count}</button>
    </div>
  );
}
