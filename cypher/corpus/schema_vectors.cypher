// Store embeddings on Section nodes: s.embedding = [float...]

CREATE VECTOR INDEX section_embedding_index IF NOT EXISTS
FOR (s:Section)
ON (s.embedding)
OPTIONS {
  indexConfig: {
    `vector.dimensions`: 768,
    `vector.similarity_function`: 'cosine'
  }
};
