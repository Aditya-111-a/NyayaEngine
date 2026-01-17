import traceback
from fastapi import Request
from fastapi.responses import JSONResponse

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.routes.health import router as health_router
from app.routes.case import router as case_router
from app.routes.reason import router as reason_router
from app.routes.facts import router as facts_router
from app.routes.sections import router as sections_router
from app.routes.intake import router as intake_router
from app.routes.fact_bulk import router as fact_bulk_router
from app.routes import graph_validator

app = FastAPI(title="Consumer Complaint Rule Engine (CPA India)")

@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception):
    return JSONResponse(
        status_code=500,
        content={
            "error": str(exc),
            "trace": traceback.format_exc()
        }
    )


app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:5173",
        "http://127.0.0.1:5173",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(health_router)
app.include_router(case_router)
app.include_router(reason_router)
app.include_router(facts_router)
app.include_router(sections_router)
app.include_router(fact_bulk_router)
app.include_router(intake_router)
app.include_router(graph_validator.router)
