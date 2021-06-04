import React from "react"
import PropTypes from "prop-types"
class Top5AdminDashboard extends React.Component {
  render () {
    return (
        <div id="top-5">
          <h2>Top 5 Customers</h2>

          <ul>
            {this.props.top5.map((t) => {
              return(
                  <li key={t.id} id={"top5-" + t.id}>
                    {t.first_name} {t.last_name} Transactions: {t.transaction_count}
                  </li>
              )
            })}
          </ul>
        </div>
    );

  }
}

Top5AdminDashboard.propTypes = {
  top5: PropTypes.array
};
export default Top5AdminDashboard
