import { useState } from "react";
import IntakePage from "./pages/IntakePage";
import QuestionsPage from "./pages/QuestionsPage";
import ResultPage from "./pages/ResultPage";

type Step = "INTAKE" | "QUESTIONS" | "RESULT";

export default function App() {
  const [step, setStep] = useState<Step>("INTAKE");
  const [data, setData] = useState<any>(null);

  function next(newData: any) {
    if (!newData) return;
    setData(newData);

    const missing = newData?.missing_questions || [];
    if (missing.length > 0) setStep("QUESTIONS");
    else setStep("RESULT");
  }

  function restart() {
    setData(null);
    setStep("INTAKE");
  }

  if (step === "INTAKE") return <IntakePage onNext={next} />;
  if (step === "QUESTIONS") return <QuestionsPage data={data} onNext={next} />;
  return <ResultPage data={data} onRestart={restart} />;
}
