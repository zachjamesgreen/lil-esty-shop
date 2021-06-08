import React from "react";

class Footer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      github_data: [],
    };
  }
  componentDidMount() {
    fetch("https://api.github.com/users/"+ this.props.login, {
      method: "GET",
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        this.setState({ github_data: data });
      });
  }

  changeBackground(e) {
    console.log("hi");
    e.target.style.color = "red";
  }
  render() {
    return (
      <React.Fragment>
        <blockquote className="blockquote">
          <div className="pl-2">
            <h5 style={{ color: "rgb(240, 242, 245)" }} className="nav-link">
              Alex Klick
            </h5>
          </div>
          <hr
            className="float-left"
            style={{
              color: "rgb(105, 0, 0)",
              marginLeft: "15px",
              border: "3px solid rgb(125, 0, 0)",
              width: "90%",
            }}
          />
          <a
            className="nav-link"
            style={{ color: "rgb(240, 242, 245)" }}
            href="#"
            onMouseOver={() => this.changeBackground}
          >
            Connect
          </a>
          <a
            href={this.state.github_data.html_url}
            data-toggle="tooltip"
            data-placement="top"
            title="click to view"
            className="nav-link"
            style={{ color: "rgb(240, 242, 245)" }}
          >
            Github: {this.state.github_data.login}
          </a>
          <span
            className="align-baseline"
            style={{ color: "rgb(240, 242, 245)" }}
          >
            <a
              className="nav-link"
              style={{ color: "rgb(240, 242, 245)" }}
              href="https://www.linkedin.com/in/alex-klick
                    "
            >
              Linkedin
            </a>
            <a className="nav-link" style={{ color: "rgb(240, 242, 245)" }}>
              aklick12@gmail.com
            </a>
          </span>
        </blockquote>
      </React.Fragment>
    );
  }
}

export default Footer;
