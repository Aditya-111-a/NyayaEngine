import { useState } from "react";
import { postJSON } from "../api";

type Props = {
  onNext: (data: any) => void;
};

export default function IntakePage({ onNext }: Props) {
  const [category, setCategory] = useState<"ECOM" | "CONSUMER">("ECOM"); // ✅ moved here
  const [complaintText, setComplaintText] = useState("");
  const [loading, setLoading] = useState<"LLM" | "MANUAL" | null>(null);
  const [error, setError] = useState("");

  async function submit(mode: "LLM" | "MANUAL") {
    setLoading(mode);
    setError("");

    try {
      const endpoint =
        mode === "LLM" ? "/complaint/intake" : "/complaint/intake/manual";

      const payload =
        mode === "LLM"
          ? { complaint_text: complaintText, top_k_questions: 6, category }
          : { complaint_text: complaintText, facts: [], category };

      const data = await postJSON(endpoint, payload);

      console.log("✅ INTAKE RESPONSE:", data);
      onNext(data);
    } catch (e: any) {
      console.error(e);
      setError(e?.message || "Intake failed");
    } finally {
      setLoading(null);
    }
  }

  return (
    <div className="max-w-3xl mx-auto p-6 space-y-4">
      <h1 className="text-2xl font-bold">Consumer Complaint Intake</h1>

      <textarea
        className="w-full border rounded-lg p-3 min-h-[180px]"
        value={complaintText}
        onChange={(e) => setComplaintText(e.target.value)}
        placeholder="Describe your complaint..."
      />

      {error && <div className="text-red-600">{error}</div>}

      <div className="border rounded-xl p-3">
        <div className="font-medium mb-2">Category</div>

        <div className="flex gap-2">
          <button
            className={`px-3 py-2 rounded-lg border ${
              category === "ECOM" ? "bg-black text-white" : ""
            }`}
            onClick={() => setCategory("ECOM")}
            type="button"
          >
            E-Commerce
          </button>

          <button
            className={`px-3 py-2 rounded-lg border ${
              category === "CONSUMER" ? "bg-black text-white" : ""
            }`}
            onClick={() => setCategory("CONSUMER")}
            type="button"
          >
            Consumer (General)
          </button>
        </div>
      </div>

      <div className="flex gap-3">
        <button
          onClick={() => submit("LLM")}
          disabled={loading !== null}
          className="px-4 py-2 rounded-lg bg-black text-white"
        >
          {loading === "LLM" ? "Extracting..." : "Auto Extract Facts (LLM)"}
        </button>

        <button
          onClick={() => submit("MANUAL")}
          disabled={loading !== null}
          className="px-4 py-2 rounded-lg border"
        >
          {loading === "MANUAL" ? "Processing..." : "Continue Manually"}
        </button>
      </div>
    </div>
  );
}
