import { useState } from "react";
import { postJSON } from "../api";

type Props = {
  data: any;
  onNext: (newData: any) => void;
};

function parseValue(raw: any, valueType: string) {
  if (raw === "" || raw === undefined || raw === null) return null;

  const vt = (valueType || "string").toLowerCase();
  if (vt === "boolean") return raw === true || raw === "true";
  if (vt === "int" || vt === "integer") return parseInt(raw, 10);
  if (vt === "number" || vt === "float") return Number(raw);
  return raw;
}

export default function QuestionsPage({ data, onNext }: Props) {
  const caseId = data?.case_id;
  const questions = data?.missing_questions || [];

  const [answers, setAnswers] = useState<Record<string, any>>({});
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  function setAnswer(fid: string, value: any) {
    setAnswers((prev) => ({ ...prev, [fid]: value }));
  }

  async function submit() {
    setLoading(true);
    setError("");

    try {
      const facts = questions.map((q: any) => ({
        fact_id: q.fact_id,
        value: parseValue(answers[q.fact_id], q.value_type || "string"),
      }));

      const resp = await postJSON(`/case/${caseId}/facts/bulk`, { facts });

      console.log("✅ BULK RESPONSE:", resp);
      onNext(resp);
    } catch (e: any) {
      console.error(e);
      setError(e?.message || "Bulk submit failed");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="max-w-4xl mx-auto p-6 space-y-4">
      <h1 className="text-2xl font-bold">Answer Missing Questions</h1>

      {!caseId && (
        <div className="text-red-600">
          case_id missing in response. Check console logs.
        </div>
      )}

      <div className="space-y-4">
        {questions.map((q: any) => {
          const fid = q.fact_id;
          const ui = (q.ui_control || "text").toLowerCase();
          const vt = (q.value_type || "string").toLowerCase();

          const val = answers[fid] ?? "";

          // boolean
          if (ui === "checkbox" || ui === "boolean" || vt === "boolean") {
            return (
              <div key={fid} className="border rounded-xl p-4">
                <label className="flex items-center gap-2">
                  <input
                    type="checkbox"
                    checked={answers[fid] === true}
                    onChange={(e) => setAnswer(fid, e.target.checked)}
                  />
                  <span>{q.question}</span>
                </label>
              </div>
            );
          }

          // number
          if (ui === "number" || vt === "int" || vt === "integer" || vt === "float" || vt === "number") {
            return (
              <div key={fid} className="border rounded-xl p-4 space-y-2">
                <div className="font-medium">{q.question}</div>
                <input
                  className="w-full border rounded-lg p-2"
                  type="number"
                  value={val}
                  onChange={(e) => setAnswer(fid, e.target.value)}
                />
              </div>
            );
          }

          // date
          if (ui === "date" || vt === "date") {
            return (
              <div key={fid} className="border rounded-xl p-4 space-y-2">
                <div className="font-medium">{q.question}</div>
                <input
                  className="w-full border rounded-lg p-2"
                  type="date"
                  value={val}
                  onChange={(e) => setAnswer(fid, e.target.value)}
                />
              </div>
            );
          }

          // default text
          return (
            <div key={fid} className="border rounded-xl p-4 space-y-2">
              <div className="font-medium">{q.question}</div>
              <input
                className="w-full border rounded-lg p-2"
                type="text"
                value={val}
                placeholder={q.placeholder || ""}
                onChange={(e) => setAnswer(fid, e.target.value)}
              />
              {q.help_text && <div className="text-xs text-gray-500">{q.help_text}</div>}
            </div>
          );
        })}
      </div>

      {error && <div className="text-red-600">{error}</div>}

      <button
        disabled={loading}
        onClick={submit}
        className="px-4 py-2 rounded-lg bg-black text-white"
      >
        {loading ? "Submitting..." : "Continue"}
      </button>
    </div>
  );
}
