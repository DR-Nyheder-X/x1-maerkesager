export default function sortByMandates (list) {
  return list.sort((a, b) => {
    return a.party.mandates - b.party.mandates
  }).reverse()
}
