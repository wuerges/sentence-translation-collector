import React, { useState } from "react";
import { set } from "@rybr/lenses";
import BulmaBg from "../../assets/images/1280x960.png";
import BulmaIcon from "../../assets/images/96x96.png";

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
        voted: false,
      },
      {
        author: "Translator 2",
        text: "Some Text in Portuguese 2",
        voted: false,
      },
      {
        author: "Translator 3",
        text: "Some Text in Portuguese 3",
        voted: false,
      },
    ],
    translation: {
      text: "Candidate translation from google translator...",
      author: "Google Translator",
      voted: false,
    },
  });

  function changeTranslation(value) {
    setData({
      ...data,
      translation: { ...data.translation, text: value, author: "Myself" },
    });
  }
  function vote(i) {
    setData(set({ ...data }, "targets", i, "voted", true));
  }
  function voteTranslation() {
    setData(set({ ...data }, "translation", "voted", true));
  }
  return (
    <>
      <div className="block">
        <div className="card">
          <div className="card-content">
            Translating from
            <span className="tag">{data.origin.lang}</span>
            to
            <span className="tag">{data.config.target}</span>
          </div>
        </div>
      </div>
      <div className="block">
        <div className="card">
          <div className="card-content">
            <div className="media">
              <div className="media-left">
                <figure className="image is-48x48">
                  <img src={BulmaIcon} />
                </figure>
              </div>
              <div className="media-content">
                <p className="title is-4">{data.origin.text}</p>
                <p className="subtitle is-6">
                  <span className="tag">{data.origin.lang}</span>
                  {data.origin.author}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="block">
        {data.targets.map((d, i) => (
          <div className="card" key={i}>
            <div className="card-content">
              <div className="media">
                <div className="media-left">
                  <figure className="image is-48x48">
                    <img src={BulmaIcon} />
                  </figure>
                </div>
                <div className="media-content">
                  <p className="title is-4">{d.text}</p>
                  <p className="subtitle is-6">
                    <span className="tag">{data.config.target}</span>
                    {d.author}
                  </p>
                </div>
                <div className="media-right">
                  <button
                    className="button is-primary"
                    onClick={() => vote(i)}
                    disabled={d.voted}
                  >
                    Upvote
                  </button>
                </div>
              </div>
            </div>
          </div>
        ))}
        <div className="card">
          <div className="card-content">
            <div className="media">
              <div className="media-left">
                <figure className="image is-48x48">
                  <img src={BulmaIcon} />
                </figure>
              </div>
              <div className="media-content">
                <input
                  className="title is-4"
                  style={{ width: "100%" }}
                  value={data.translation.text}
                  onChange={(e) => changeTranslation(e.target.value)}
                  disabled={data.translation.voted}
                />
                <p className="subtitle is-6">
                  <span className="tag">{data.config.target}</span>
                  {data.translation.author}
                </p>
              </div>
              <div className="media-right">
                <button
                  className="button is-primary"
                  onClick={voteTranslation}
                  disabled={data.translation.voted}
                >
                  Upvote
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="block">
        <div className="card">
          <div className="card-content">
            <a className="button is-primary">Easy</a>
            <a className="button is-primary">Again</a>
          </div>
        </div>
      </div>
    </>
  );
}
