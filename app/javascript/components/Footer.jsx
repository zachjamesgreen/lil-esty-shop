import React from "react";
import Link from "./styled_components/link";
class Footer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      github_data: [
        // edit linkedin and names
        {
          "linkedin-url-b": ["zacksemail@gmail.com", "Zach Green"],
          "linkedin-url-c": ["noahemail@gmail.com", "Noah Zinter"],
          "alex-klick": ["aklick12@gmail.com", "Alex Klick"],
          "linkedin-url-d": ["zackemails@gmail.com", "Zach Trokey"],
        },
      ],
    };
  }
  componentDidMount() {
    let contributors_ids = [7896916, 20480167, 60951642, 77814101];
    fetch(
      "https://api.github.com/repos/zachjamesgreen/lil-esty-shop/contributors",
      {
        method: "GET",
      }
    )
      .then((response) => response.json())
      .then((data) => {
        let useful = [];
        data.forEach((line) => {
          contributors_ids.includes(line.id)
            ? (useful = useful.concat(line))
            : null;
        });
        let update_data = this.state.github_data.concat(useful);
        this.setState({ github_data: update_data });
      });
  }
  render() {
    let users = this.state.github_data.slice(1).map((user, index) => {
      return (
        <React.Fragment>
          <div className="col-3 col-sm-5 mt-4 mb-4 pt-2">
            <blockquote className="blockquote">
              <Link
                className="nav-link"
                href={
                  "https://www.linkedin.com/in/" +
                  Object.keys(this.state.github_data[0])[index]
                }
              >
                <i class="fab fa-linkedin">
                  {" "}
                  {Object.values(this.state.github_data[0])[index][1]}
                </i>
              </Link>
              <Link href={user.html_url} className="nav-link">
                <i class="fab fa-github-square"></i> {user.login}
              </Link>
              <hr
                className="float-left"
                style={{
                  color: "rgb(105, 0, 0)",
                  marginLeft: "15px",
                  border: "3px solid rgb(125, 0, 0)",
                  width: "90%",
                }}
              />{" "}
              <a className="nav-link" style={{ color: "rgb(240, 242, 245)" }}>
                {Object.values(this.state.github_data[0])[index][0]}
              </a>
            </blockquote>
          </div>
        </React.Fragment>
      );
    });
    console.log(this.state.github_data[0]);
    return (
      <div className="col-12 mt-2 pt-2">
        <div className="row justify-content-center">
          <div className="col-2 mt-4 mb-4 pt-2">
            <blockquote className="blockquote">
              <div className="mx-auto">
                <h5 style={{ color: "rgb(240, 242, 245)" }}>See Our Devs</h5>
              </div>
            </blockquote>
          </div>
          {users}
        </div>
      </div>
    );
  }
}
export default Footer;
