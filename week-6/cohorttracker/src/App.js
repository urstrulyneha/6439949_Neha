import React from 'react';
import CohortDetails from './CohortDetails';

function App() {
  const sampleCohorts = [
    {
      cohortCode: 'FSWD-01',
      technology: 'Full Stack Web Dev',
      startDate: '2025-07-01',
      currentStatus: 'ongoing',
      coachName: 'Ravi Kumar',
      trainerName: 'Anjali Singh'
    },
    {
      cohortCode: 'DSA-02',
      technology: 'Data Structures',
      startDate: '2025-06-15',
      currentStatus: 'completed',
      coachName: 'Neha Sharma',
      trainerName: 'Amit Patel'
    }
  ];

  return (
    <div>
      {sampleCohorts.map((cohort, index) => (
        <CohortDetails key={index} cohort={cohort} />
      ))}
    </div>
  );
}

export default App;
