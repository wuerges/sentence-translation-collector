import React from "react";
import PropTypes from "prop-types";
import SentenceTranslator from "./SentenceTranslator";

class HelloWorld extends React.Component {
  render() {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
        <SentenceTranslator />
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string,
};
export default HelloWorld;
