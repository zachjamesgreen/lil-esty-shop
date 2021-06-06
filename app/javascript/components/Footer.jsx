import React from "react";
import Link from "./styled_components/link";
class Footer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      github_data: [],
    };
  }
  componentDidMount() {
    fetch("https://api.github.com/users/alexklick", {
      method: "GET",
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        this.setState({ github_data: data });
      });
  }
  render() {
    return (
      <div className="col-12 col-lg-10 mt-2 pt-2">
        <div className="row">
          <div className="col-3 mt-2 pt-2">
            <blockquote className="blockquote">
              <div className="mx-auto">
                <h5 style={{ color: "rgb(240, 242, 245)" }}>See Our Devs</h5>
              </div>
            </blockquote>
          </div>
          <div className="col-6 col-sm-3 mt-2 pt-2">
            <blockquote className="blockquote">
              <h5 style={{ color: "rgb(240, 242, 245)" }} className="nav-link">
                Alex Klick
              </h5>
              <h5 className="nav-link" style={{ color: "rgb(240, 242, 245)" }}>
                Connect
              </h5>
              <hr
                className="float-left"
                style={{
                  color: "rgb(105, 0, 0)",
                  marginLeft: "15px",
                  border: "3px solid rgb(125, 0, 0)",
                  width: "90%",
                }}
              />
              <Link href={this.state.github_data.html_url} className="nav-link">
                Github: {this.state.github_data.login}
              </Link>
              <Link
                className="nav-link"
                href="https://www.linkedin.com/in/alex-klick"
              >
                Linkedin
              </Link>
              <a className="nav-link" style={{ color: "rgb(240, 242, 245)" }}>
                aklick12@gmail.com
              </a>
            </blockquote>
          </div>
        </div>
      </div>
    );
  }
}

export default Footer;
