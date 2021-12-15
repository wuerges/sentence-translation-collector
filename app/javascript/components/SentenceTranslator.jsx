import React, { useState } from "react";
import { set } from "@rybr/lenses";

export default function SentenceTranslator() {
  const [data, setData] = useState({
    config: {
      target: "pt_BR",
    },
    origin: {
      lang: "en_US",
      author: "Some Author",
      text: "Some Text in English",
    },
    targets: [
      {
        author: "Translator 1",
        text: "Some Text in Portuguese 1",
      },
      {
        author: "Translator 2",
        text: "Some Text in Portuguese 2",
      },
      {
        author: "Translator 3",
        text: "Some Text in Portuguese 3",
      },
    ],
  });
  return (
    <div>
      <p>
        {data.origin.lang} {"->"} {data.config.target}
      </p>

      {data.targets.map((d, i) => (
        <div key={i}>
          <input value={d.author} disabled />
          <input value={d.text} disabled />
        </div>
      ))}
    </div>
  );
}
