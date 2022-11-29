#include <iostream>
#include <string>
#include <vector>
#include <list>
#include <queue> // priority_queue
#include <functional> // std::greater
#include <set>

#define DEBUG 0
#define debug(valor) if(DEBUG) cout << "\t<" << valor << ">" << endl
#define paracada(it, lista) for(auto it = lista.begin(); it != lista.end(); ++it)
#define repete(i, a, b) for(int i = a; i <= b; ++i)
#define rep(i, n) for(int i = 0; i < n; ++i)
#define pb push_back
#define INF 0x7FFFFFFF

using namespace std;

typedef pair<int, int> ii;
typedef vector<int> vi;
typedef vector<ii> vii;
typedef vector<bool> vb;
typedef list<int> li;

using namespace std;

typedef std::vector<int> vi;
typedef std::vector<std::string> vs;

vi dijsktra (vector<vii> listaAdjacencia, int numeroDeVertices, int verticeOrigem);

int main (int argc,char **argv) {
    debug ("Debug ativado");

    // Variáveis

    // Entrada

    // Execução

    return 0;
}

vi dijsktra (vector<vii> listaAdjacencia, int numeroDeVertices, int verticeOrigem) {
    // Dijkstra routine
	vi dist(numeroDeVertices, INF); dist[verticeOrigem] = 0; // INF = 1B to avoid overflow
	priority_queue< ii, vector<ii>, greater<ii> > pq; pq.push(ii(0, verticeOrigem));
	                         // ^to sort the pairs by increasing distance from verticeOrigem
	while (!pq.empty()) { // main loop
		ii front = pq.top(); pq.pop(); // greedy: pick shortest unvisited vertex
		int d = front.first, u = front.second;
		if (d == dist[u]) // this check is important, see the explanation
			paracada (v, listaAdjacencia[u]) { // all outgoing edges from u
				if (dist[u] + v->second < dist[v->first]) {
					dist[v->first] = dist[u] + v->second; // relax operation
					pq.push(ii(dist[v->first], v->first));
				}
			}
	}  // note: this variant can cause duplicate items in the priority queue
	return dist;
}
