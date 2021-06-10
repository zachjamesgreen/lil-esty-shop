import React from "react";
import Link from "./styled_components/link";
class Footer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      github_data: [
        // edit linkedin and names
        {/*  "zachjamesgreen": ["zachjamesgreen@gmail.com", "Zach Green"],*/}
        {/*  "noah-zinter-267b58208": ["noah.zinter@gmail.com", "Noah Zinter"],*/}
        {/*  "alex-klick": ["aklick12@gmail.com", "Alex Klick"],*/}
        {/*  "zach-trokey-853582127": ["ztrokey@gmail.com", "Zach Trokey"],*/}

        ["alex-klick", "Alex Klick"],
        ["zachjamesgreen", "Zach Green"],
        ["noah-zinter-267b58208", "Noah Zinter"],
        ["zach-trokey-853582127", "Zach Trokey"],

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
        <div className="col-6 col-sm-6 col-md-3 col-xl-2 mt-4 mb-4">
          <div className="d-block p-0">
            <Link href={user.html_url} className="nav-link">
              <i className="fab fa-github-square"> </i> {user.login}
            </Link>
          </div>
          <div className="d-block mb-4 p-0">
            <Link
              className="nav-link"
              href={
                "https://www.linkedin.com/in/" +
                this.state.github_data[0][index][0]
              }
            >
              <i className="fab fa-linkedin"> </i>{" "}
              {this.state.github_data[0][index][1]}
            </Link>
          </div>
        </div>
      );
    });
    return (
      <div className="col-12 mt-4 pt-2 mb-2 px-2 g-0 ">
        <div className="col-2 mx-auto">
          <div className="">
            <h5 style={{ color: "rgb(240, 242, 245)" }}>Hire Our Devs</h5>
          </div>
        </div>
        <div className="row justify-content-center">{users}</div>
      </div>
    );
  }
}
export default Footer;
