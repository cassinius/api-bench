using Npgsql;

namespace Core8Npgsql;

public class NpgsqlConn
{
    private readonly string _connStr;
    private NpgsqlConnection? _conn = null;

    public NpgsqlConn(string connStr)
    {
        _connStr = connStr;
    }

    public async Task<NpgsqlConnection> GetConn()
    {
        if (_conn == null)
        {
            _conn = new NpgsqlConnection(_connStr);
            await _conn.OpenAsync();
        }
        return _conn;
    }
}
