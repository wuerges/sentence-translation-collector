import React, { useState } from "react";
import { set } from "@rybr/lenses";

function Sentence(props) {
  const [data, setData] = props.value;

  return (
    <>
      <p>Author: {data.author} </p>
      <input value={data.text} disabled />
      <input
        value={data.text}
        onChange={(e) => setData({ ...data, text: e.target.value })}
      />
    </>
  );
}

export default function SentenceTranslator() {
  const [count, setCount] = useState(0);
  const [data, setData] = useState([{ author: "Author", text: "Some Text" }]);
  return (
    <div>
      <p>YAY from React: {count}</p>
      <button onClick={() => setCount(count + 1)}>{count}</button>
      {data.map((d, i) => (
        <Sentence key={i} value={[d, (t) => setData(set([...data], i, t))]} />
      ))}
    </div>
  );
}
