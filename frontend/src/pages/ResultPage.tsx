type Props = {
  data: any;
  onRestart: () => void;
};

export default function ResultPage({ data, onRestart }: Props) {
  const final = data?.reasoning_result?.final_decision || {};

  const summary = final?.summary || "";
  const remedies = final?.remedies || [];
  const actions = final?.actions || [];
  const citations = final?.citations || [];

  return (
    <div className="max-w-4xl mx-auto p-6 space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">Result</h1>
        <button className="border rounded-lg px-3 py-2" onClick={onRestart}>
          New Complaint
        </button>
      </div>

      <div className="border rounded-xl p-4">
        <h2 className="text-lg font-semibold">Summary</h2>
        <p className="mt-2 text-gray-700">{summary || "—"}</p>
      </div>

      <div className="border rounded-xl p-4">
        <h2 className="text-lg font-semibold">Remedies</h2>
        <ul className="list-disc pl-5 mt-2 space-y-1">
          {remedies.length ? remedies.map((r: any, i: number) => (
            <li key={i}>
              <b>{r?.name || r?.remedy_id}</b>
              {r?.description ? ` — ${r.description}` : ""}
            </li>
          )) : <li>—</li>}
        </ul>
      </div>

      <div className="border rounded-xl p-4">
        <h2 className="text-lg font-semibold">Recommended Steps</h2>
        <ol className="list-decimal pl-5 mt-2 space-y-1">
          {actions.length ? actions.map((a: any, i: number) => (
            <li key={i}>
              <b>{a?.name || a?.action_id}</b>
              {a?.description ? ` — ${a.description}` : ""}
            </li>
          )) : <li>—</li>}
        </ol>
      </div>

      <div className="border rounded-xl p-4">
        <h2 className="text-lg font-semibold">Legal Basis</h2>
        <ul className="list-disc pl-5 mt-2 space-y-1">
          {citations.length ? citations.map((c: any, i: number) => (
            <li key={i}>
              <b>{c?.section_no || "—"}</b>
              {c?.title ? ` — ${c.title}` : ""}
            </li>
          )) : <li>—</li>}
        </ul>
      </div>
    </div>
  );
}
